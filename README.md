simditor-emoji
==============

[Simditor](http://simditor.tower.im/) 的第三方扩展，为工具栏提高按钮，在内容中插入 Emoji 图片。

#####如何使用

在 Simditor 的基础上额外引用 simditor-emoji 的脚本和样式 

```js
<link media="all" rel="stylesheet" type="text/css" href="vendor/assets/stylesheets/simditor-emoji.css" />
<script src="vendor/assets/javascripts/simditor-emoji.js"></script>
```

配置

```js
new Simditor({
	textarea: textareaElement,
	...,
	toolbar: [..., 'emoji'],
	emoji: {
		imagePath: 'images/emoji/'
	}
})
```

#####参数

**imagePath** (Type: String)  

emoji 图片的路径，相对或者绝对路径都可以

默认值: `'images/emoji/'`


**images** (Type: Array)

按钮菜单中提供哪些 emoji 图片供用户选择

默认值: `[
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
  ]`
