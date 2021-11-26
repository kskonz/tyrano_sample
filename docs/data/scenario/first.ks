[macro name=Choices]
[if exp="tf.cab==0"]
[link target=*AnsA]A [graph storage="cabimg.jpg"][endlink][r]
[link target=*AnsB]B [graph storage="letimg.jpg"][endlink][r]
[s]
[else]
[link target=*AnsA]A [graph storage="letimg.jpg"][endlink][r]
[link target=*AnsB]B [graph storage="cabimg.jpg"][endlink][r]
[s]
[endif]
[endmacro]

*start

[title name="キャベツとレタス"]
[hidemenubutton]
[wait time=200]
[freeimage layer="base"]

[bg storage=kitchen.png time=500]

[cm]

キャベツかレタス、正しい方を選んでね[l][r]

クリックしてゲームスタート！[l][r]

[cm]

[iscript]
tf.pattern = Math.floor( Math.random() * 4) + 1
tf.cab = Math.floor( Math.random() * 2)
tf.let = 1 - tf.cab
tf.Answer=0
[endscript]


[if exp="tf.pattern == 1"]

[eval exp="tf.Answer = tf.cab"]
キャベツはどっち？[l][r]
[Choices]

[elsif exp="tf.pattern == 2"]

[eval exp="tf.Answer = tf.let"]
レタスはどっち？[l][r]
[Choices]

[elsif exp="tf.pattern == 3"]

[eval exp="tf.Answer = tf.let"]
キャベツじゃないのはどっち？[l][r]
[Choices]

[elsif exp="tf.pattern == 4]

[eval exp="tf.Answer = tf.cab"]
レタスじゃないのはどっち？[l][r]
[Choices]

[endif]

*AnsA

[if exp="tf.Answer == 0"]

[r][r][r]正解![r]

[else]

[r][r][r]不正解…[r]

[endif]

[l][cm]

[jump target=*start]

*AnsB

[if exp="tf.Answer == 1"]

[r][r][r]正解![r]

[else]

[r][r][r]不正解…[r]

[endif]

[l][cm]

[jump target=*start]
