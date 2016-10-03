Ext.require([ '*' ]);
Ext.onReady(function() {

	Ext.QuickTips.init();

	var bd = Ext.getBody();

	// 台別情報のModel
	Ext.define('ImageModel', {
		extend : 'Ext.data.Model',
		fields : [ {
			name : 'id',
			type : 'string'
		}, {
			name : 'playDate',
			type : 'string'
		}, {
			name : 'taiNo',
			type : 'integer'
		}, {
			name : 'bonusCount',
			type : 'integer'
		}, {
			name : 'ballInput',
			type : 'integer'
		}, {
			name : 'ballOutput',
			type : 'integer'
		}, {
			name : 'rate',
			type : 'integer'
		}, {
			name : 'playDateN',
			type : 'string'
		}, {
			name : 'bonusCountN',
			type : 'integer'
		}, {
			name : 'ballInputN',
			type : 'integer'
		}, {
			name : 'ballOutputN',
			type : 'integer'
		}, {
			name : 'rateN',
			type : 'integer'
		}, {
			name : 'totalOut',
			type : 'integer'
		}, {
			name : 'totalOutN',
			type : 'integer'
		}, {
			name : 'outMax',
			type : 'integer'
		} ]
	});
	// 台番のModel
	Ext.define('taiNoModel', {
		extend : 'Ext.data.Model',
		fields : [ 'taiNo' ]
	});
	// 台別情報のStore
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
	// 台番のStore
	var dsTaiNoStore = Ext.create('Ext.data.Store', {
		model : 'taiNoModel',
		proxy : {
			type : 'ajax',
			url : 'GetTaiNoList',
			reader : {
				type : 'json',
				root : 'root'
			}
		},
		autoLoad : true
	});
	// 検索ボタン
	var btnSreachByTaiNo = Ext.create('Ext.Button', {
		text : '検索',
		handler : function() {
			piaDataStore.load({
				url : 'GetPiaDataForChart?taiNo=' + combTaiNo.getValue()
			});
		}
	});
	// 台番
	var combTaiNo = Ext.create('Ext.form.field.ComboBox', {
		fieldLabel : 'TAI_NO',
		store : dsTaiNoStore,
		queryMode : 'local',
		displayField : 'taiNo',
		valueField : 'taiNo'
	});
	// 台別情報のGridPanel
	var piaDataGrid = Ext.create('Ext.grid.Panel', {
		region : 'south',
		collapsible : true,
		height : 700,
		store : piaDataStore,
		flex : 0.8,
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
	// ################################## 台別編集用FormPanel
	// 保存ボタン
	var btnSave = Ext.create('Ext.Button', {
		text : 'Save',
		listeners : {
			click : function() {
				var inputform = piaDataFormPanel.getForm();
				inputform.url = 'SavePiaData';
				if (inputform.isValid()) {
					inputform.submit({
						success : function(form, action) {
							var strTaiNo = form.getValues().taiNo
							combTaiNo.setValue(strTaiNo);
							piaDataStore.load({
								url : 'GetPiaDataForChart?taiNo=' + strTaiNo
							});
							Ext.Msg.alert('Success', action.result.msg);
						},
						failure : function(form, action) {
							Ext.Msg.alert('Failed', action.result.msg);
						}
					});
				}

			}
		}
	});
	// 削除ボタン
	var btnDelete = Ext.create('Ext.Button', {
		text : 'Delete',
		listeners : {
			click : function() {

				var inputform = piaDataFormPanel.getForm();
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
		}
	});
	// クリアボタン
	var btnClear = Ext.create('Ext.Button', {
		text : 'Clear',
		listeners : {
			click : function() {
				piaDataFormPanel.getForm().reset();
			}
		}
	});
	// 台別編集用FormPanel
	var piaDataFormPanel = Ext.create('Ext.form.Panel', {
		flex : 0.2,
		layout : 'form',
		region : 'east',
		collapsible : true,
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
		tbar : [ btnSave, {
			xtype : 'tbseparator'
		}, btnDelete, {
			xtype : 'tbseparator'
		}, btnClear ],
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
		} ]
	});

	// ################################ chart
	var chartBonusCount = Ext.create('Ext.chart.Chart', {

		animate : false,
		store : piaDataStore,
		axes : [ {
			type : 'Numeric',
			position : 'left',
			fields : [ 'ballOutputN', 'outMax', 'totalOutN', 'rateN' ],
			title : false,
			grid : true,
			label : {
				renderer : Ext.util.Format.numberRenderer('0,0'),
				font : '9px Arial'
			}
		}, {
			type : 'Category',
			position : 'bottom',
			fields : [ 'playDateN' ],
			title : false,
			label : {
				font : '9px Arial'
			}
		} ],
		series : [
				{
					type : 'line',
					axis : 'left',
					xField : 'playDateN',
					yField : 'rateN',
					tips : {
						trackMouse : true,
						width : 90,
						height : 30,
						renderer : function(storeItem, item) {
							this.setTitle(storeItem.get('rateN') + ' 確率 ');
						}
					},
					style : {
						fill : '#993399',
						stroke : '#993399'
					},
					markerConfig : {
						type : 'circle',
						size : 2,
						radius : 2,
						fill : '#993399',
						stroke : '#993399'
					}
				},
				{
					type : 'line',
					axis : 'left',
					xField : 'playDateN',
					yField : 'outMax',
					tips : {
						trackMouse : true,
						width : 90,
						height : 30,
						renderer : function(storeItem, item) {
							this.setTitle(storeItem.get('outMax') + ' 玉 ');
						}
					},
					style : {
						fill : '#006600',
						stroke : '#006600'
					},
					markerConfig : {
						type : 'circle',
						size : 2,
						radius : 2,
						fill : '#006600',
						stroke : '#006600'
					}
				},
				{
					type : 'line',
					axis : 'left',
					xField : 'playDateN',
					yField : 'totalOutN',
					tips : {
						trackMouse : true,
						width : 90,
						height : 30,
						renderer : function(storeItem, item) {
							this.setTitle(storeItem.get('totalOutN') + ' 玉 ');
						}
					},
					style : {
						fill : '#660033',
						stroke : '#660033'
					},
					markerConfig : {
						type : 'circle',
						size : 2,
						radius : 2,
						fill : '#660033',
						stroke : '#660033'
					}
				},
				{
					type : 'column',
					axis : 'left',
					highlight : true,
					tips : {
						trackMouse : true,
						width : 140,
						height : 28,
						renderer : function(storeItem, item) {
							this.setTitle(storeItem.get('playDateN') + '日  : '
									+ storeItem.get('ballOutputN') + ' 玉');
						}
					},
					xField : 'playDateN',
					yField : 'ballOutputN',
					style : {
						fill : '#00001a',
						stroke : '#00001a'
					}
				} ]
	});

	var filterPanel = Ext.create('Ext.panel.Panel', {

		tbar : [ combTaiNo, btnSreachByTaiNo ],
		bodyPadding : 5, // Don't want content to crunch against the borders
		region : 'center',
		// collapsible : true,
		// height : 500,
		layout : 'fit',
		title : '図',
		items : [ chartBonusCount ]
	});

	var borderPanel = Ext.create('Ext.Panel', {
		title : '台別情報',
		layout : {
			type : 'border',
			padding : 5
		},
		defaults : {
			split : true
		},
		items : [ piaDataFormPanel, piaDataGrid, filterPanel ]
	});

	var piaDataTabPanel = Ext.create('Ext.tab.Panel', {
		activeTab : 0,
		items : [ borderPanel ]
	});
	var viewport = Ext.create('Ext.Viewport', {
		layout : {
			type : 'fit',
			padding : 5
		},
		defaults : {
			split : true
		},
		items : [ piaDataTabPanel ]
	});

});