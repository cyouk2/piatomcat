Ext.require([ '*' ]);
Ext.onReady(function() {

	Ext.QuickTips.init();

	var bd = Ext.getBody();

	Ext.define('ImageModel', {
		extend : 'Ext.data.Model',
		fields : [ 'id', 'kind', 'playDate', 'taiNo', 'bonusCount',
				'ballInput', 'ballOutput', 'rate' ]
	});

	var piaDataStore = Ext.create('Ext.data.JsonStore', {
		model : 'ImageModel',
		proxy : {
			type : 'ajax',
			url : 'GetPiaDataForChart',
			reader : {
				type : 'json',
				root : 'root'
			}
		}
	});

	var dsTaiNo = Ext.create('Ext.data.Store', {
		fields : [ 'taiNo', 'taiNoName' ],
		data : []
	});

	Ext.Ajax.request({
		url : 'GetTaiNoList',
		params : {},
		success : function(r) {
			var res = Ext.decode(r.responseText, true);
			var records = [];
			Ext.each(res.root, function(obj) {
				records.push({
					taiNo : obj.taiNo,
					taiNoName : obj.taiNo
				})
			});
			dsTaiNo.loadData(records);
		},
		failure : function(r) {

		}
	});

	var btnSreachByTaiNo = Ext.create('Ext.Button', {
		text : '検索',
		handler : function() {
			piaDataStore.load({
				url : 'GetPiaDataForChart?taiNo=' + combTaiNo.getValue()
			});
		}
	});

	var combTaiNo = Ext.create('Ext.form.field.ComboBox', {
		fieldLabel : 'TAI_NO',
		store : dsTaiNo,
		queryMode : 'local',
		displayField : 'taiNo',
		valueField : 'taiNoName'
	});

	var piaDataGrid = Ext.create('Ext.grid.Panel', {
		region: 'center', 
		store : piaDataStore,
		flex : 0.7,
		title : 'データ',
		columns : [ {
			text : 'id',
			hidden : true,
			dataIndex : 'id'
		}, {
			text : 'PLAY_DATE',
			width : 75,
			sortable : true,
			dataIndex : 'playDate'
		}, {
			text : 'TAI_NO',
			width : 75,
			sortable : true,
			dataIndex : 'taiNo'
		}, {
			text : 'BONUS_COUNT',
			width : 100,
			sortable : true,
			dataIndex : 'bonusCount'
		}, {
			text : 'RATE',
			width : 75,
			sortable : true,
			dataIndex : 'rate'
		}, {
			text : 'BALL_OUTPUT',
			width : 100,
			sortable : true,
			dataIndex : 'ballOutput'
		} ],
		listeners : {
			select : function(dv, record, item, index, e) {
				piaDataFormPanel.getForm().loadRecord(record);
			}
		}
	});

	var piaDataFormPanel = Ext.create('Ext.form.Panel', {
		flex : 0.3,
		layout : 'form',
		region:'west',
		collapsible: true,
		url : 'SavePiaData',
		standardSubmit : false,
		frame : true,
		title : '入力',
		bodyPadding : '5 5 0',
		fieldDefaults : {
			msgTarget : 'side',
			labelWidth : 60
		},
		defaultType : 'textfield',
		items : [ {
			xtype : 'hiddenfield',
			name : 'id',
			value : ''
		}, {
			fieldLabel : 'playDate',
			xtype : 'datefield',
			name : 'playDate',
			allowBlank : false,
			maxValue : new Date(),
			value : new Date(),
			format : 'Ymd',
		}, {
			fieldLabel : 'taiNo',
			name : 'taiNo',
			allowBlank : false,
			xtype : 'numberfield',
			value : 570
		}, {
			fieldLabel : 'bonusCount',
			name : 'bonusCount',
			xtype : 'numberfield',
			minValue : 0,
			value : 0,
			maxValue : 100
		}, {
			fieldLabel : 'rate',
			name : 'rate',
			xtype : 'numberfield',
			minValue : 0,
			value : 0
		}, {
			fieldLabel : 'ballOutput',
			name : 'ballOutput',
			xtype : 'textfield',
			value : "0"
		} ],
		buttons : [ {
			text : 'SAVE',
			formBind : true, // only enabled once the form is valid
			disabled : true,
			handler : function() {
				var inputform = this.up('form').getForm();
				inputform.url = 'SavePiaData';
				if (inputform.isValid()) {
					inputform.submit({
						success : function(form, action) {
							var strTaiNo = form.getValues().taiNo
							combTaiNo.setValue(strTaiNo);
							piaDataStore.load({
								url : 'GetPiaDataForChart?taiNo=' + strTaiNo
							});
						},
						failure : function(form, action) {
							Ext.Msg.alert('Failed', action.result.msg);
						}
					});
				}
			}
		}, {
			text : 'DELETE',
			formBind : true, // only enabled once the form is valid
			disabled : true,
			handler : function() {
				var inputform = this.up('form').getForm();
				inputform.url = 'DeletePiaData';
				if (inputform.isValid()) {
					inputform.submit({
						success : function(form, action) {
							var strTaiNo = form.getValues().taiNo
							combTaiNo.setValue(strTaiNo);
							piaDataStore.reload();
							inputform.reset();
							Ext.Msg.alert('Success', action.result.msg);
						},
						failure : function(form, action) {
							Ext.Msg.alert('Failed', action.result.msg);
						}
					});
				}
			}
		}, {
			text : 'Cancel',
			handler : function() {
				this.up('form').getForm().reset();
			}
		} ]
	});
	var viewport = Ext.create('Ext.Viewport', {
		layout : {
			type : 'fit',
			padding : 5
		},
		defaults : {
			split : true
		},
		items : [ {
			tbar : [ combTaiNo, btnSreachByTaiNo ],
			layout :'border',
//			border : false,
//			bodyStyle : 'background-color: transparent',
			items : [piaDataFormPanel, piaDataGrid ]
		} ]
	});
});