/**
 * @license Copyright (c) 2003-2017, CKSource - Frederico Knabben. All rights reserved.
 * For licensing, see LICENSE.md or http://ckeditor.com/license
 */



CKEDITOR.editorConfig = function( config ) {
	 config.language = 'jp';
	 config.toolbarGroups = [
		{ name: 'document', groups: [ 'mode', 'document', 'doctools' ] },
		{ name: 'clipboard', groups: [ 'clipboard', 'undo' ] },
		{ name: 'editing', groups: [ 'find', 'selection', 'spellchecker', 'editing' ] },
		{ name: 'forms', groups: [ 'forms' ] },
		'/',
		{ name: 'basicstyles', groups: [ 'basicstyles', 'cleanup' ] },
		{ name: 'paragraph', groups: [ 'list', 'indent', 'blocks', 'align', 'bidi', 'paragraph' ] },
		{ name: 'links', groups: [ 'links' ] },
		{ name: 'insert', groups: [ 'insert' ] },
		'/',
		{ name: 'styles', groups: [ 'styles' ] },
		{ name: 'colors', groups: [ 'colors' ] },
		{ name: 'tools', groups: [ 'tools' ] },
		{ name: 'others', groups: [ 'others' ] },
		{ name: 'about', groups: [ 'about' ] }
	];

	config.removeButtons = 'NewPage,Save,Preview,Cut,Copy,Paste,PasteText,PasteFromWord,About';
	
	//eqneditor
	config.extraPlugins = 'uploadimage,uploadwidget,widget,widgetselection,notificationaggregator,uploadfile,dragresize,tableresize,codesnippet,templates,dialog,dialogui,html5video,widget,widgetselection,clipboard,lineutils,oembed';
	//config.imageUploadUrl = 'cKEditorDragAndDropFileUpload';
	config.uploadUrl = 'cKEditorDragAndDropFileUpload';
	config.enterMode = CKEDITOR.ENTER_BR;
	// Define changes to default configuration here. For example:
	// config.language = 'fr';
	// config.uiColor = '#AADC6E';
};
