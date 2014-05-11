
class EmojiButton extends SimditorButton

  @avaliableImages = [
    'smile'
    'smiley'
    'laughing'
    'blush'
    'heart_eyes'
    'smirk'
    'flushed'
    'satisfied'
    'grin'
    'wink'
    'stuck_out_tongue_winking_eye'
    'stuck_out_tongue'
    'sleeping'
    'worried'
    'expressionless'
    'sweat_smile'
    'cold_sweat'
    'joy'
    'sob'
    'angry'
    'mask'
    'scream'
    'sunglasses'
    'heart'
    'broken_heart'
    'star'
    'anger'
    'exclamation'
    'question'
    'zzz'
    'thumbsup'
    'thumbsdown'
    'ok_hand'
    'punch'
    'v'
    'clap'
    'muscle'
    'pray'
    'skull'
    'trollface'
  ]

  name: 'emoji'

  icon: 'smile-o'

  title: '表情'

  htmlTag: 'img'

  menu: true

  renderMenu: ->
    tpl = '''
      <ul class="emoji-list">
      </ul>
    '''

    avaliableImages = @editor.opts.emoji.avaliableImages || EmojiButton.avaliableImages

    html = ""
    dir  = @editor.opts.emoji.imagePath.replace(/\/$/, '') + '/'

    for name in avaliableImages
      html += "<li data-name='#{ name }'><img src='#{ dir }#{ name }.png' width='20' height='20' /></li>"

    $list= $(tpl)
    $list.html(html).appendTo(@menuWrapper)

    $list.on 'mousedown', 'li', (e) =>
      @wrapper.removeClass('menu-on')
      return unless @editor.inputManager.focused

      $img = $(e.currentTarget).find('img').clone()
                .data('emoji', true).attr('data-emoji', true)
      @editor.selection.insertNode $img

      @editor.trigger 'valuechanged'
      @editor.trigger 'selectionchanged'


Simditor.Toolbar.addButton EmojiButton
