bubbly({
  blur:15,
  colorStart: '#4c004c',
  colorStop: '#1a001a',
  radiusFunc:() => 5 + Math.random() * 15,
  angleFunc:() => -Math.PI / 2,
  velocityFunc:() => Math.random() * 5,
  bubbleFunc:() => `hsla(${200 + Math.random() * 50}, 100%, 65%, .1)`,
  bubbles: 50,
  canvas: document.querySelector("#background")
});

$('.marquee').marquee({
  //duration in milliseconds of the marquee
  duration: 20000,
  //gap in pixels between the tickers
  gap: 100,
  //time in milliseconds before the marquee will start animating
  delayBeforeStart: 0,
  //'left' or 'right'
  direction: 'left',
  //true or false - should the marquee be duplicated to show an effect of continues flow
  duplicated: false
});
