###
Saeki Magic Stone Project v1.0.1
Created by @hisasann
Released under the MIT License
###
(() ->
  $ ->
    canvas = $('#canvas')
    context = canvas[0].getContext '2d'
    stage = undefined
    emitters = []
    circle = undefined
    particles = []
    saeki = undefined
    container = undefined
    loaded = false

    loadManifest = [
      {id: 'saeki', src: './images/saeki.png'}
      {id: 'magic_stone', src: './images/魔法石.png'}
    ]
    loader = new createjs.LoadQueue(true)
    loader.setMaxConnections(10)
    # それぞれがロードされたタイミング
    loader.addEventListener 'fileload', (event) ->

      # すべてのロードが終わったタイミング
    loader.addEventListener 'complete', (event) ->
      initialize()

    loader.loadManifest loadManifest

    tick = () ->
      stage.update()

    resize = ->
      # styleではなくwidth, heightに入れないとダメ！
      canvas[0].width = $(window).width()
      canvas[0].height = $(window).height()
      return

    move = (event) ->
      if !loaded
        return

      emitterMove event.stageX + 30, event.stageY - 110

      saeki.x = event.stageX
      saeki.y = event.stageY

      return

    emitterMove = (x, y) ->
      _(emitters).forEach((emitter) ->
        emitter.position = new createjs.Point(x, y)
        return true
      )

    addParticleEmitter = (x, y, particleImage) ->
      emitter = new createjs.ParticleEmitter(particleImage)
      emitter.emitterType = createjs.ParticleEmitterType.Emit
      emitter.emissionRate = 1000
      emitter.maxParticles = 2000
      emitter.life = 2000
      emitter.lifeVar = 0
      emitter.speed = 500
      emitter.speedVar = 0
      emitter.positionVarX = 0
      emitter.positionVarY = 0
      emitter.accelerationX = 0
      emitter.accelerationY = 600
      emitter.radialAcceleration = 0
      emitter.radialAccelerationVar = 0
      emitter.tangentalAcceleration = 0
      emitter.tangentalAccelerationVar = 0
      emitter.angle = 0
      emitter.angleVar = 360
      emitter.startSpin = 0
      emitter.startSpinVar = 360
      emitter.endSpin = null
      emitter.endSpinVar = null
      emitter.startColor = [
        255
        255
        255
      ]
      emitter.startColorVar = [
        255
        255
        255
      ]
      emitter.startOpacity = 1
      emitter.endColor = null
      emitter.endColorVar = null
      emitter.endOpacity = 1
      emitter.startSize = 60
      emitter.startSizeVar = 40
      emitter.endSize = null
      emitter.endSizeVar = null

      emitters.push emitter

      container.addChild emitter
      return

    initialize = () ->
      # stage
      stage = new createjs.Stage(canvas[0])
      stage.autoClear = true
      stage.enableMouseOver 20
      stage.addEventListener 'stagemousemove', move

      # 設定
      createjs.Ticker.setFPS 60
      createjs.Ticker.timingMode = createjs.Ticker.RAF
      createjs.Touch.enable stage  if createjs.Touch.isSupported()
      createjs.Ticker.addEventListener 'tick', tick

      # 佐伯画像
      saeki = new createjs.Bitmap(loader.getResult 'saeki')
      saeki.regX = saeki.image.width / 2
      saeki.regY = saeki.image.height / 2
      saeki.x = canvas.width() / 2
      saeki.y = canvas.height() / 2
      saeki.scaleX = 100
      saeki.scaleY = 100
      stage.addChild(saeki)
      createjs.Tween.get(saeki, {loop: false})
      .wait(250)
      .to(
        scaleX: 0.5
        scaleY: 0.5
        , 1500, createjs.Ease.backOut)
      .call(complete)

      # パーティクル
      container = new createjs.Container()
      stage.addChild container
      addParticleEmitter canvas.width() / 2, canvas.height() / 2, loader.getResult 'magic_stone'
      emitterMove canvas.width() / 2 - 1500, canvas.height() / 2

      stage.update()

      $(window).on 'resize', resize

    complete = () ->
#      console.log 'complete'

      loaded = true

    resize()
)()