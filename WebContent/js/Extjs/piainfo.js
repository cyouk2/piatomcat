Ext.require([ '*' ]);
Ext.onReady(function() {

	Ext.QuickTips.init();
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
		}, {
			name : 'lineno',
			type : 'string'
		}, {
			name : 'ballin',
			type : 'string'
		}, {
			name : 'bonus',
			type : 'string'
		}, {
			name : 'big16r',
			type : 'string'
		}, {
			name : 'middle8r',
			type : 'string'
		}, {
			name : 'small4r',
			type : 'string'
		}, {
			name : 'starttotal',
			type : 'string'
		} ]
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
	// 台別情報のStore
	var piaDataStore = Ext.create('Ext.data.JsonStore', {
		model : 'outTotalModel',
		proxy : {
			type : 'ajax',
			url : 'GetTaiInfoList',
			reader : {
				type : 'json',
				root : 'root'
			}
		}
	});
	// 検索ボタン
	var btnSreachByTaiNo = Ext.create('Ext.Button', {
		text : 'Search',
		handler : function() {
			piaDataStore.load({
				params : {
					shop : combShop.getValue(),
					taino : combTaiNo.getValue()
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

	var chartBonusCount = Ext.create('Ext.chart.Chart', {
		animate : true,
		store : piaDataStore,
		legend : {
			position : 'bottom'
		},
		style : 'background:#fff',
		axes : [
				{
					type : 'Numeric',
					position : 'left',
					fields : [ 'shop', 'playdate', 'taino', 'lineno', 'ballin',
							'bonus', 'big16r', 'middle8r', 'small4r',
							'starttotal' ],
					title : false,
					label : {
						renderer : Ext.util.Format.numberRenderer('0,0'),
						font : '9px Arial'
					},
					grid : {
						odd : {
							opacity : 1,
							fill : '#ddd',
							stroke : '#bbb',
							'stroke-width' : 100
						}
					}
				}, {
					type : 'Category',
					position : 'bottom',
					fields : [ 'lineno' ],
					title : false,
					label : {
						font : '9px Arial'
					}
				} ],
		series : [ {
			type : 'column',
			axis : 'left',
			highlight : true,
			tips : {
				trackMouse : true,
				width : 140,
				height : 28,
				renderer : function(storeItem, item) {
					this.setTitle(storeItem.get('bonus') + '連  : ' + ' 16R:'
							+ storeItem.get('big16r') + '>>'
							+ storeItem.get('ballin'));
				}
			},
			xField : 'lineno',
			yField : 'ballin',
            label: {
                display: 'insideEnd',
                'text-anchor': 'middle',
                  field: 'data1',
                  renderer: Ext.util.Format.numberRenderer('0'),
                  orientation: 'vertical',
                  color: '#333'
              },
			style : {
				fill : '#00001a',
				stroke : '#00001a'
			}
		} ]
	});

	var filterPanel = Ext.create('Ext.Panel', {
		tbar : [ combShop, combTaiNo, btnSreachByTaiNo ],
		layout : 'fit',
		title : 'GRAPH',
		items : [ chartBonusCount ]
	});
	// ########################## viewport ##################
	var viewport = Ext.create('Ext.Viewport', {
		layout : {
			type : 'fit',
			padding : 2
		},
		items : [ filterPanel ],
		listeners : {
			render : function(view, eOpts) {
			}
		}
	});
});