describe 'Simditor Emoji', ->
  editor = null
  $textarea = null
  btn = null
  menu = null

  afterEach ->
    editor?.destroy()
    editor = null
    $textarea.remove()
    $textarea = null
    btn = null
    menu = null

  describe 'features', ->
    beforeEach ->
      $textarea = $('<textarea id="editor"></textarea>').appendTo 'body'
      editor = new Simditor
        textarea: $textarea
        toolbar: ['emoji', 'bold']

      btn = $('.simditor-toolbar .toolbar-item-emoji')
      menu = $('.simditor-toolbar .toolbar-menu-emoji')

    it 'should render emoji button', ->
      expect(btn).toExist()
      expect(menu).toExist()

    it 'should work all right on insert a emoji', ->
      editor.focus()
      btn.click()
      menu.find('li:first').mousedown()
      expect(editor.body.find('img[data-emoji]')).toExist()

  describe 'config', ->
    beforeEach ->
      $textarea = $('<textarea id="editor"></textarea>').appendTo 'body'

    it 'should work all right on custom config', ->
      path = '/simditor/emoji/images/'

      editor = new Simditor
        textarea: $textarea
        toolbar: ['emoji', 'bold']
        emoji:
          imagePath: path
          images: ['smile']

      btn = $('.simditor-toolbar .toolbar-item-emoji')
      menu = $('.simditor-toolbar .toolbar-menu-emoji')

      expect(menu.find('li').length).toBe 1

      editor.focus()
      btn.click()
      menu.find('li:first').mousedown()

      src = editor.body.find('img[data-emoji]').attr('src')
      expect((new RegExp(path)).test(src)).toBeTruthy()

