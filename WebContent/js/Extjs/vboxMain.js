Ext.require([ '*' ]);
Ext.onReady(function() {

	Ext.QuickTips.init();

	var bd = Ext.getBody();
	// 全台出玉情報のModel
	Ext.define('taiInfoModel', {
		extend : 'Ext.data.Model',
		fields : [ {
			name : 'playDate',
			type : 'string'
		}, {
			name : 'playDateN',
			type : 'string'
		}, {
			name : 'totalOut',
			type : 'integer'
		}, {
			name : 'totalOutBefore',
			type : 'integer'
		} ]

	});
	// 台別情報のModel
	Ext.define('ImageModel', {
		extend : 'Ext.data.Model',
		fields : [ {
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

	Ext.define('outTotalModel', {
		extend : 'Ext.data.Model',
		fields : [ {
			name : 'taiNo',
			type : 'string'
		}, {
			name : 'ballInput',
			type : 'integer'
		}, {
			name : 'totalOut',
			type : 'integer'
		}, {
			name : 'totalOutBefore',
			type : 'integer'
		}, {
			name : 'rank',
			type : 'string'
		}, {
			name : 'playDate',
			type : 'string'
		}, {
			name : 'rate',
			type : 'integer'
		}, {
			name : 'rate1',
			type : 'integer'
		}, {
			name : 'rate2',
			type : 'integer'
		}, {
			name : 'rate3',
			type : 'integer'
		}, {
			name : 'rate4',
			type : 'integer'
		}, {
			name : 'rate5',
			type : 'integer'
		}, {
			name : 'ballOutput',
			type : 'integer'
		}, {
			name : 'ballOutput1',
			type : 'integer'
		}, {
			name : 'ballOutput2',
			type : 'integer'
		}, {
			name : 'ballOutput3',
			type : 'integer'
		}, {
			name : 'ballOutput4',
			type : 'integer'
		}, {
			name : 'ballOutput5',
			type : 'integer'
		}, {
			name : 'bonusCount',
			type : 'integer'
		}, {
			name : 'bonusCount1',
			type : 'integer'
		}, {
			name : 'bonusCount2',
			type : 'integer'
		}, {
			name : 'bonusCount3',
			type : 'integer'
		}, {
			name : 'bonusCount4',
			type : 'integer'
		} , {
			name : 'bonusCount5',
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
		text : 'Search',
		handler : function() {
			piaDataStore.load({
				url : 'GetPiaDataForChart?taiNo=' + combTaiNo.getValue()
			});
		}
	});
	// 台番
	var combTaiNo = Ext.create('Ext.form.field.ComboBox', {
		fieldLabel : 'TaiNo',
		labelWidth : 40,
		width: 120,
		store : dsTaiNoStore,
		queryMode : 'local',
		displayField : 'taiNo',
		valueField : 'taiNo'
	});
	// 台別情報のGridPanel
	var piaDataGrid = Ext.create('Ext.grid.Panel', {

		tbar : [ combTaiNo, btnSreachByTaiNo ],
		region : 'center',
		// collapsible : true,
		store : piaDataStore,
		title : 'DATA',
		columns : [ {
			text : 'DATE',
			width : 75,
			sortable : true,
			dataIndex : 'playDate'
		}, {
			text : 'TAI',
			width : 50,
			sortable : true,
			dataIndex : 'taiNo'
		}, {
			text : 'BONUS',
			width : 50,
			sortable : true,
			dataIndex : 'bonusCount'
		}, {
			text : 'BALL_IN',
			width : 70,
			sortable : true,
			dataIndex : 'ballInput'
		}, {
			text : 'RATE',
			width : 70,
			sortable : true,
			align : 'right',
			dataIndex : 'rate',
			renderer : function(value) {
				if (value > 0 && value < 120) {
					return '<span style="color:green;">' + value + '</span>';
				} else {
					return value;
				}
			}
		}, {
			text : 'BALL_OUT',
			width : 70,
			sortable : true,
			align : 'right',
			dataIndex : 'ballOutput',
			renderer : function(value) {
				if (value > 0) {
					return '<span style="color:red;">' + value + '</span>';
				} else {
					return value;
				}
			}
		}, {
			text : 'SATAMA',
			width : 70,
			sortable : true,
			align : 'right',
			dataIndex : 'totalOut',
			renderer : function(value) {
				if (value > 0) {
					return '<span style="color:red;">' + value + '</span>';
				} else {
					return value;
				}
			}
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
		width : 200,
		layout : 'form',
		region : 'east',
		collapsible : true,
		url : 'SavePiaData',
		standardSubmit : false,
		frame : true,
		title : 'FORM',
		bodyPadding : '5 5 0',
		fieldDefaults : {
			msgTarget : 'side',
			labelWidth : 90
		},
		defaultType : 'textfield',
		tbar : [ btnSave, {
			xtype : 'tbseparator'
		}, btnDelete, {
			xtype : 'tbseparator'
		}, btnClear ],
		items : [ {
			fieldLabel : 'PLAY_DATE',
			xtype : 'datefield',
			name : 'playDate',
			allowBlank : false,
			maxValue : new Date(),
			value : Ext.Date.add(new Date(), Ext.Date.DAY, -1),
			format : 'Ymd'
		}, {
			fieldLabel : 'TAI_NO',
			name : 'taiNo',
			allowBlank : false,
			xtype : 'numberfield',
			value : 557
		}, {
			fieldLabel : 'BONUS_COUNT',
			name : 'bonusCount',
			xtype : 'numberfield',
			minValue : 0,
			value : 0,
			maxValue : 100
		}, {
			fieldLabel : 'RATE',
			name : 'rate',
			xtype : 'numberfield',
			minValue : 0,
			value : 0
		}, {
			fieldLabel : 'BALL_OUTPUT',
			name : 'ballOutput',
			xtype : 'textfield',
			value : "-"
		} ]
	});

	// ################################ chart
	var chartBonusCount = Ext.create('Ext.chart.Chart', {

		animate : false,
		store : piaDataStore,
		axes : [ {
			type : 'Numeric',
			position : 'left',
			fields : [ 'ballOutputN', 'outMax', 'totalOutN', 'rate' ],
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
					yField : 'rate',
					tips : {
						trackMouse : true,
						width : 90,
						height : 30,
						renderer : function(storeItem, item) {
							this.setTitle(storeItem.get('rate') + ' 確率 ');
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

	var filterPanel = Ext.create('Ext.Panel', {
		bodyPadding : 5,
		region : 'south',
		collapsible : true,
		height : 500,
		layout : 'fit',
		title : 'GRAPH',
		items : [ chartBonusCount ]
	});

	var borderPanel = Ext.create('Ext.Panel', {
		title : 'TAI_INFO',
		layout : {
			type : 'border',
			padding : 5
		},
		defaults : {
			split : true
		},
		items : [ piaDataFormPanel, piaDataGrid, filterPanel ]
	});

	// #######################差玉情報#############
	// 差玉情報のStore
	var balloutInfoOfAllDaysStore = Ext.create('Ext.data.Store', {
		model : 'taiInfoModel',
		proxy : {
			type : 'ajax',
			url : 'GetTaiInfoOfAllDays',
			reader : {
				type : 'json',
				root : 'root'
			}
		},
		autoLoad : true
	});

	// 台別情報
	var balloutInfoOfAllDaysChart = Ext.create('Ext.chart.Chart', {
		animate : false,
		store : balloutInfoOfAllDaysStore,
		axes : [ {
			type : 'Numeric',
			position : 'left',
			fields : [ 'totalOut', 'totalOutBefore' ],
			title : false,
			grid : true,
			label : {
				renderer : Ext.util.Format.numberRenderer('0,0'),
				font : '8px Arial'
			}
		}, {
			type : 'Category',
			position : 'bottom',
			fields : [ 'playDateN' ],
			title : false,
			label : {
				font : '8px Arial'
			}
		} ],
		series : [
				{
					type : 'line',
					axis : 'left',
					xField : 'playDateN',
					yField : 'totalOutBefore',
					tips : {
						trackMouse : true,
						width : 120,
						height : 20,
						renderer : function(storeItem, item) {
							this.setTitle(' 総差玉 :'
									+ storeItem.get('totalOutBefore'));
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
					type : 'column',
					axis : 'left',
					highlight : true,
					tips : {
						trackMouse : true,
						width : 140,
						height : 20,
						renderer : function(storeItem, item) {
							this.setTitle(storeItem.get('playDateN') + '日  : '
									+ storeItem.get('totalOut') + ' 差玉');
						}
					},
					xField : 'playDateN',
					yField : 'totalOut',
					style : {
						fill : '#cc00cc',
						stroke : '#cc00cc'
					}
				} ]
	});
	// 差玉情報のchartPanel
	var balloutInfoOfAllDaysPanel = Ext.create('Ext.Panel', {
		layout : 'fit',
		title : 'SATAMA_INFO',
		items : [ balloutInfoOfAllDaysChart ]
	});

	// ##################### outputInfoPanel ##################

	// 台番のStore
	var outputInfoStore = Ext.create('Ext.data.Store', {
		model : 'outTotalModel',
		proxy : {
			type : 'ajax',
			url : 'GetPiaDataByDate',
			reader : {
				type : 'json',
				root : 'root'
			}
		}
	});
	var playDatePicker = Ext.create('Ext.form.field.Date', {
		fieldLabel : 'PLAY_DATE',
		editable : false,
		labelWidth : 80,
		width: 180,
		maxValue : new Date(),
		value : Ext.Date.add(new Date(), Ext.Date.DAY, -1),
		format : 'Ymd'
	});
	// ソート区分のStore
	var sortKindStore = Ext.create('Ext.data.Store', {
		fields : [ 'abbr', 'name' ],
		data : [ {
			'abbr' : 'ballOutput',
			'name' : '本日出玉'
		}, {
			'abbr' : 'totalOutBefore',
			'name' : '前日差玉'
		}, {
			'abbr' : 'totalOut',
			'name' : '本日差玉'
		}, {
			'abbr' : 'rate',
			'name' : '前日確率'
		} ]
	});
	// ソート区分
	var sortSelectField = Ext.create('Ext.form.ComboBox', {
		fieldLabel : 'SORT',
		labelWidth : 50,
		width: 150,
		queryMode : 'local',
		editable : false,
		store : sortKindStore,
		value : 'ballOutput',
		valueField : 'abbr',
		displayField : 'name'
	});
	// 検索ボタン
	var SreachOutputInfoBtn = Ext.create('Ext.Button', {
		text : 'Search',
		handler : function() {
			outputInfoStore.load({
				params : {
					playDate : Ext.Date
							.format(playDatePicker.getValue(), 'Ymd'),
					sortKind : sortSelectField.getValue()
				}
			});
		}
	});

	var OutputInfoGrid = Ext.create('Ext.grid.Panel', {
		tbar : [ playDatePicker, sortSelectField, SreachOutputInfoBtn ],
		region : 'center',
		// collapsible : true,
		store : outputInfoStore,
		title : 'OUTPUTINFO',
		columns : [ {
			text : 'DATE',
			width : 75,
			sortable : true,
			dataIndex : 'playDate'
		}, {
			text : 'TAI',
			width : 50,
			sortable : true,
			dataIndex : 'taiNo'
		}, {
			text : 'BONUS',
			width : 50,
			sortable : true,
			dataIndex : 'bonusCount'
		}, {
			text : 'BALL_IN',
			width : 70,
			sortable : true,
			dataIndex : 'ballInput'
		}, {
			text : 'SATAMA',
			width : 70,
			sortable : true,
			align : 'right',
			dataIndex : 'totalOut',
			renderer : function(value) {
				if (value > 0) {
					return '<span style="color:red;font-weight: bolder;">' + value + '</span>';
				} else {
					return value;
				}
			}
		}, {
			text : 'SATAMA1',
			width : 100,
			sortable : true,
			align : 'right',
			dataIndex : 'totalOutBefore',
			renderer : function(value) {
				if (value > 0) {
					return '<span style="color:red;font-weight: bolder;">' + value + '</span>';
				} else {
					return value;
				}
			}
		} , {
			text : 'RATE',
			width : 70,
			sortable : true,
			align : 'right',
			dataIndex : 'rate'/*,
			renderer : function(value) {
				if (value > 0 && value < 120) {
					return '<span style="color:blue;font-weight: bolder;">' + value + '</span>';
				} else {
					return value;
				}
			}*/
		}, {
			text : 'RATE1',
			width : 70,
			sortable : true,
			align : 'right',
			dataIndex : 'rate1'/*,
			renderer : function(value) {
				if (value > 0 && value < 120) {
					return '<span style="color:blue;font-weight: bolder;">' + value + '</span>';
				} else {
					return value;
				}
			}*/
		}, {
			text : 'RATE2',
			width : 70,
			sortable : true,
			align : 'right',
			dataIndex : 'rate2'/*,
			renderer : function(value) {
				if (value > 0 && value < 120) {
					return '<span style="color:blue;font-weight: bolder;">' + value + '</span>';
				} else {
					return value;
				}
			}*/
		}, {
			text : 'RATE3',
			width : 70,
			sortable : true,
			align : 'right',
			dataIndex : 'rate3'/*,
			renderer : function(value) {
				if (value > 0 && value < 120) {
					return '<span style="color:blue;font-weight: bolder;">' + value + '</span>';
				} else {
					return value;
				}
			}*/
		}, {
			text : 'RATE4',
			width : 70,
			sortable : true,
			align : 'right',
			dataIndex : 'rate4'/*,
			renderer : function(value) {
				if (value > 0 && value < 120) {
					return '<span style="color:blue;font-weight: bolder;">' + value + '</span>';
				} else {
					return value;
				}
			}*/
		}, {
			text : 'RATE5',
			width : 70,
			sortable : true,
			align : 'right',
			dataIndex : 'rate5'/*,
			renderer : function(value) {
				if (value > 0 && value < 120) {
					return '<span style="color:blue;font-weight: bolder;">' + value + '</span>';
				} else {
					return value;
				}
			}*/
		}, {
			text : 'BALL_OUT',
			width : 80,
			sortable : true,
			align : 'right',
			dataIndex : 'ballOutput',
			renderer : function(value) {
				if (value > 0) {
					return '<span style="color:red;font-weight: bolder;">' + value + '</span>';
				} else {
					return value;
				}
			}
		}, {
			text : 'BALL_OUT1',
			width : 80,
			sortable : true,
			align : 'right',
			dataIndex : 'ballOutput1',
			renderer : function(value) {
				if (value > 0) {
					return '<span style="color:red;font-weight: bolder;">' + value + '</span>';
				} else {
					return value;
				}
			}
		}, {
			text : 'BALL_OUT2',
			width : 80,
			sortable : true,
			align : 'right',
			dataIndex : 'ballOutput2',
			renderer : function(value) {
				if (value > 0) {
					return '<span style="color:red;font-weight: bolder;">' + value + '</span>';
				} else {
					return value;
				}
			}
		}, {
			text : 'BALL_OUT3',
			width : 80,
			sortable : true,
			align : 'right',
			dataIndex : 'ballOutput3',
			renderer : function(value) {
				if (value > 0) {
					return '<span style="color:red;font-weight: bolder;">' + value + '</span>';
				} else {
					return value;
				}
			}
		}, {
			text : 'BALL_OUT4',
			width : 80,
			sortable : true,
			align : 'right',
			dataIndex : 'ballOutput4',
			renderer : function(value) {
				if (value > 0) {
					return '<span style="color:red;font-weight: bolder;">' + value + '</span>';
				} else {
					return value;
				}
			}
		}, {
			text : 'BALL_OUT5',
			width : 80,
			sortable : true,
			align : 'right',
			dataIndex : 'ballOutput5',
			renderer : function(value) {
				if (value > 0) {
					return '<span style="color:red;font-weight: bolder;">' + value + '</span>';
				} else {
					return value;
				}
			}
		}]
	});

	// ########################## tabPanel ##################
	var piaDataTabPanel = Ext.create('Ext.tab.Panel', {
		activeTab : 0,
		items : [ borderPanel, OutputInfoGrid, balloutInfoOfAllDaysPanel ]
	});

	// ########################## viewport ##################
	var viewport = Ext.create('Ext.Viewport', {
		layout : {
			type : 'fit',
			padding : 5
		},
		defaults : {
			split : true
		},
		items : [ piaDataTabPanel ],
		listeners : {
			render : function(view, eOpts) {
			}
		}
	});

});