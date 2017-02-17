Ext.require([ '*' ]);
Ext.onReady(function() {

	Ext.QuickTips.init();
	var renderforBallsout = function(value) {
		if (value >= 2500) {
			return '<span style="color:red;font-weight: bolder;">' + value + '</span>';
		} else {
			return value;
		}
	};
	Ext.define('outTotalModel', {
		extend : 'Ext.data.Model',
		fields : [ {
			name : 'shop',
			type : 'string'
		}, {
			name : 'playdate',
			type : 'string'
		}, {
			name : 'taino',
			type : 'string'
		}]
	});
	// 店舗のStore
	var dsShopStore = Ext.create('Ext.data.Store', {
		model : 'outTotalModel',
		proxy : {
			type : 'ajax',
			url : 'GetShopList',
			reader : {
				type : 'json',
				root : 'root'
			}
		},
		autoLoad : true
	});
	// 台番のStore
	var dsTaiNoStore = Ext.create('Ext.data.Store', {
		model : 'outTotalModel',
		proxy : {
			type : 'ajax',
			url : 'GetTaiNoList',
			reader : {
				type : 'json',
				root : 'root'
			}
		},
		autoLoad : false
	});

	// 検索ボタン
	var btnSreachByTaiNo = Ext.create('Ext.Button', {
		text : 'Search',
		handler : function() {
			var myparams = {
				shop : combShop.getValue(),
				taino : combTaiNo.getValue()
			}
			Ext.Ajax.request({
			    url: 'GetTaiInfoList2',
			    params:myparams,
			    success: function(response){
			        var text = response.responseText;
			        var a = Ext.JSON.decode(text);
			        conse(a.root);
			        ballin(a.root);
			        // process server response here
			    }
			});
			
		}
	});
	// 店舗のcombox
	var combShop = Ext.create('Ext.form.field.ComboBox', {
		fieldLabel : 'SHOP',
		labelWidth : 40,
		width : 120,
		store : dsShopStore,
		queryMode : 'local',
		displayField : 'shop',
		valueField : 'shop',
		listeners : {
			select : function(combo, records, eOpts) {
				
				dsTaiNoStore.load({
					params : {
						shop : combo.getValue()
					}
				});
			}
		}
	});
	// 台番のcombox
	var combTaiNo = Ext.create('Ext.form.field.ComboBox', {
		fieldLabel : 'TAINO',
		labelWidth : 40,
		width : 120,
		store : dsTaiNoStore,
		queryMode : 'local',
		displayField : 'taino',
		valueField : 'taino'
	});

	var toolbar = Ext.create('Ext.toolbar.Toolbar', {
	    width   : 300,
	    margin  : '5 0 0 0',
	    items   :[ combShop, combTaiNo, btnSreachByTaiNo ]
	});
	toolbar.render('grid-example');

});