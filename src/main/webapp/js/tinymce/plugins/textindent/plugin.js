/**
 * text-indent 首行缩进
 * @author chen jia hao
 * @Date 2019-04-27
 * Tinymce-Version: 5.0.3
 */
(function () {
	'use strict';
	tinymce.PluginManager.add('textindent', function(editor, url) {
	   
	  editor.on('init', function () {
			editor.formatter.register({
				textindent: {block: 'p', styles: {'text-indent': '%value'}},
			});
	  });
	  editor.ui.registry.addButton('text-indent', {
		//text: '首行缩进',
		tooltip: '首行缩进',
		icon:'indent',
		onAction: function () {
			//var content = editor.getContent();
			//console.log(editor.selection);
			var selectedNode = editor.selection.getNode();
			var style = editor.dom.getAttrib(selectedNode, 'style').toLowerCase().replace(/\s/g,'');
			var pattern = /text-indent:[^0]{1}\d*\w*;/;
			if(style && (pattern).test(style)){
				var s = style.replace(pattern,'');
				console.log(s);
				if(!s){
					editor.dom.setAttrib(selectedNode, 'style','');
				}else{
					editor.dom.setAttrib(selectedNode, 'style',s);
				}
				//tinymce.activeEditor.formatter.apply('textindent', {value : '0'});
			}else{
				tinymce.activeEditor.formatter.apply('textindent', {value : '2em'});
			}
			//console.log(style);
			//console.log(selectedNode);
			editor.focus();
		}
	  })
	});
})();

