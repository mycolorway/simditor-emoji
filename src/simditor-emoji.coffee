
class EmojiButton extends Simditor.Button
  @i18n =
    'zh-CN':
      emoji: '表情'
    'en-US':
      emoji: 'emoji'

  @images = [
    'smile'
    'smiley'
    'laughing'
    'blush'
    'heart_eyes'
    'smirk'
    'flushed'
    'grin'
    'wink'
    'kissing_closed_eyes'
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

  menu: true

  constructor: (args...) ->
    super args...
    $.merge @editor.formatter._allowedAttributes['img'], ['data-emoji', 'alt']

  renderMenu: ->
    tpl = '''
      <ul class="emoji-list">
      </ul>
    '''

    opts = $.extend({
      imagePath: 'images/emoji/'
      images: EmojiButton.images
    }, @editor.opts.emoji || {})

    html = ""
    dir  = opts.imagePath.replace(/\/$/, '') + '/'

    for name in opts.images
      html += "<li data-name='#{ name }'><img src='#{ dir }#{ name }.png' width='20' height='20' alt='#{ name }' /></li>"

    $list= $(tpl)
    $list.html(html).appendTo(@menuWrapper)

    $list.on 'mousedown', 'li', (e) =>
      @wrapper.removeClass('menu-on')
      return unless @editor.inputManager.focused

      $img = $(e.currentTarget).find('img').clone()
        .attr({
          'data-emoji': true
          'data-non-image': true
        })
      @editor.selection.insertNode $img

      @editor.trigger 'valuechanged'
      @editor.trigger 'selectionchanged'
      false

  status: ->
    # do nothing

Simditor.Toolbar.addButton EmojiButton
