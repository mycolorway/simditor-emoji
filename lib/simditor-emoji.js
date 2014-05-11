(function() {
  var EmojiButton,
    __hasProp = {}.hasOwnProperty,
    __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

  EmojiButton = (function(_super) {
    __extends(EmojiButton, _super);

    function EmojiButton() {
      return EmojiButton.__super__.constructor.apply(this, arguments);
    }

    EmojiButton.avaliableImages = ['smile', 'smiley', 'laughing', 'blush', 'heart_eyes', 'smirk', 'flushed', 'satisfied', 'grin', 'wink', 'stuck_out_tongue_winking_eye', 'stuck_out_tongue', 'sleeping', 'worried', 'expressionless', 'sweat_smile', 'cold_sweat', 'joy', 'sob', 'angry', 'mask', 'scream', 'sunglasses', 'heart', 'broken_heart', 'star', 'anger', 'exclamation', 'question', 'zzz', 'thumbsup', 'thumbsdown', 'ok_hand', 'punch', 'v', 'clap', 'muscle', 'pray', 'skull', 'trollface'];

    EmojiButton.prototype.name = 'emoji';

    EmojiButton.prototype.icon = 'smile-o';

    EmojiButton.prototype.title = '表情';

    EmojiButton.prototype.htmlTag = 'img';

    EmojiButton.prototype.menu = true;

    EmojiButton.prototype.renderMenu = function() {
      var $list, avaliableImages, dir, html, name, tpl, _i, _len;
      tpl = '<ul class="emoji-list">\n</ul>';
      avaliableImages = this.editor.opts.emoji.avaliableImages || EmojiButton.avaliableImages;
      html = "";
      dir = this.editor.opts.emoji.imagePath.replace(/\/$/, '') + '/';
      for (_i = 0, _len = avaliableImages.length; _i < _len; _i++) {
        name = avaliableImages[_i];
        html += "<li data-name='" + name + "'><img src='" + dir + name + ".png' width='20' height='20' /></li>";
      }
      $list = $(tpl);
      $list.html(html).appendTo(this.menuWrapper);
      return $list.on('mousedown', 'li', (function(_this) {
        return function(e) {
          var $img;
          _this.wrapper.removeClass('menu-on');
          if (!_this.editor.inputManager.focused) {
            return;
          }
          $img = $(e.currentTarget).find('img').clone().data('emoji', true).attr('data-emoji', true);
          _this.editor.selection.insertNode($img);
          _this.editor.trigger('valuechanged');
          return _this.editor.trigger('selectionchanged');
        };
      })(this));
    };

    return EmojiButton;

  })(SimditorButton);

  Simditor.Toolbar.addButton(EmojiButton);

}).call(this);
