/**
 * @license Copyright (c) 2003-2017, CKSource - Frederico Knabben. All rights reserved.
 * For licensing, see LICENSE.md or http://ckeditor.com/license
 */



CKEDITOR.editorConfig = function( config ) {
	config.extraPlugins = 'uploadimage,uploadwidget,widget,widgetselection,notificationaggregator,uploadfile,dragresize,tableresize,codesnippet,eqneditor,templates,dialog,dialogui,html5video,widget,widgetselection,clipboard,lineutils';
	//config.imageUploadUrl = 'cKEditorDragAndDropFileUpload';
	config.uploadUrl = 'cKEditorDragAndDropFileUpload';
	config.enterMode = CKEDITOR.ENTER_BR;
	// Define changes to default configuration here. For example:
	// config.language = 'fr';
	// config.uiColor = '#AADC6E';
};
