(function() {
  describe('Simditor Emoji', function() {
    var $textarea, btn, editor, menu;
    editor = null;
    $textarea = null;
    btn = null;
    menu = null;
    afterEach(function() {
      if (editor != null) {
        editor.destroy();
      }
      editor = null;
      $textarea.remove();
      $textarea = null;
      btn = null;
      return menu = null;
    });
    describe('features', function() {
      beforeEach(function() {
        $textarea = $('<textarea id="editor"></textarea>').appendTo('body');
        editor = new Simditor({
          textarea: $textarea,
          toolbar: ['emoji', 'bold']
        });
        btn = $('.simditor-toolbar .toolbar-item-emoji');
        return menu = $('.simditor-toolbar .toolbar-menu-emoji');
      });
      it('should render emoji button', function() {
        expect(btn).toExist();
        return expect(menu).toExist();
      });
      return it('should work all right on insert a emoji', function() {
        editor.focus();
        btn.click();
        menu.find('li:first').mousedown();
        return expect(editor.body.find('img[data-emoji]')).toExist();
      });
    });
    return describe('config', function() {
      beforeEach(function() {
        return $textarea = $('<textarea id="editor"></textarea>').appendTo('body');
      });
      return it('should work all right on custom config', function() {
        var path, src;
        path = '/simditor/emoji/images/';
        editor = new Simditor({
          textarea: $textarea,
          toolbar: ['emoji', 'bold'],
          emoji: {
            imagePath: path,
            images: ['smile']
          }
        });
        btn = $('.simditor-toolbar .toolbar-item-emoji');
        menu = $('.simditor-toolbar .toolbar-menu-emoji');
        expect(menu.find('li').length).toBe(1);
        editor.focus();
        btn.click();
        menu.find('li:first').mousedown();
        src = editor.body.find('img[data-emoji]').attr('src');
        return expect((new RegExp(path)).test(src)).toBeTruthy();
      });
    });
  });

}).call(this);
