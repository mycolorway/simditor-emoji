# Simditor Emoji
[![Circle CI](https://circleci.com/gh/mycolorway/simditor-emoji.png?style=badge)](https://circleci.com/gh/mycolorway/simditor-emoji)


[Simditor](http://simditor.tower.im/) 的官方扩展，为工具栏提高按钮，在内容中插入 Emoji 图片。

###如何使用

在 Simditor 的基础上额外引用 simditor-emoji 的脚本和样式

```html
<link rel="stylesheet" type="text/css" href="/assets/stylesheets/simditor-emoji.css" />
<script src="/assets/javascripts/simditor-emoji.js"></script>
```

配置

```javascript
new Simditor({
	textarea: textareaElement,
	...,
	toolbar: [..., 'emoji'],
	emoji: {
		imagePath: 'images/emoji/'
	}
})
```

###参数

**imagePath** (Type: String)

emoji 图片的路径，相对或者绝对路径都可以

默认值: `'images/emoji/'`


**images** (Type: Array)

按钮菜单中提供哪些 emoji 图片供用户选择

默认值: `[
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
  ]`
