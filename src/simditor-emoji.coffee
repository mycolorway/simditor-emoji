
class EmojiButton extends Simditor.Button
  @i18n =
    'zh-CN':
      emoji: '表情'
    'en-US':
      emoji: 'emoji'

  @images = [
    'smile.png'
    'smiley.png'
    'laughing.png'
    'blush.png'
    'heart_eyes.png'
    'smirk.png'
    'flushed.png'
    'grin.png'
    'wink.png'
    'kissing_closed_eyes.png'
    'stuck_out_tongue_winking_eye.png'
    'stuck_out_tongue.png'
    'sleeping.png'
    'worried.png'
    'expressionless.png'
    'sweat_smile.png'
    'cold_sweat.png'
    'joy.png'
    'sob.png'
    'angry.png'
    'mask.png'
    'scream.png'
    'sunglasses.png'
    'heart.png'
    'broken_heart.png'
    'star.png'
    'anger.png'
    'exclamation.png'
    'question.png'
    'zzz.png'
    'thumbsup.png'
    'thumbsdown.png'
    'ok_hand.png'
    'punch.png'
    'v.png'
    'clap.png'
    'muscle.png'
    'pray.png'
    'skull.png'
    'trollface.png'
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
      src = "#{ dir }#{ name }"
      name = name.split('.')[0]
      html += "<li data-name='#{ name }'><img src='#{ src }' width='20' height='20' alt='#{ name }' /></li>"

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
