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
			name : 'sortno',
			type : 'string'
		}, {
			name : 'playdate',
			type : 'string'
		}, {
			name : 'taino',
			type : 'string'
		}, {
			name : 'lineno',
			type : 'integer'
		}, {
			name : 'ballin',
			type : 'integer'
		}, {
			name : 'bonus',
			type : 'integer'
		}, {
			name : 'big16r',
			type : 'integer'
		}, {
			name : 'middle8r',
			type : 'integer'
		}, {
			name : 'small4r',
			type : 'integer'
		}, {
			name : 'starttotal',
			type : 'integer'
		}, {
			name : 'ballindiv',
			type : 'integer'
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
        axes: [{
            type: 'Numeric',
            position: 'left',
            fields: ['ballindiv','ballin'],
            label: {
                renderer: Ext.util.Format.numberRenderer('0,0')
            },
            title: 'start',
            grid: true,
            minimum: 0
        }, {
            type: 'Category',
            position: 'bottom',
            fields: ['bonus'],
            title: '連'
        }],
        series: [{
            type: 'column',
            axis: 'left',
            highlight: true,
            tips: {
              trackMouse: true,
              width: 100,
              height: 80,
              renderer: function(storeItem, item) {
                this.setTitle(storeItem.get('playdate') + '<br />start:' +storeItem.get('ballin') + '<br />' +'大：' + storeItem.get('big16r') + '<br />中：' + storeItem.get('middle8r') + '<br />小：' + storeItem.get('small4r'));
              }
            },
            label: {
              display: 'insideEnd',
              'text-anchor': 'middle',
                field: 'ballindiv',
                renderer: Ext.util.Format.numberRenderer('0'),
                orientation: 'vertical',
                color: '#333'
            },
            xField: 'bonus',
            yField: 'ballindiv'
        },{
			type : 'line',
			axis : 'left',
			xField : 'bonus',
			yField : 'ballin',
			smooth : true,
			style : {
				fill : '#006600',
				stroke : '#006600',
				'stroke-width' : 1
			},
			highlight : {
				size : 1,
				radius : 1
			},
			markerConfig : {
				type : 'circle',
				size : 2,
				radius : 2,
				fill : '#006600',
				stroke : '#006600'
			}
		}]
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