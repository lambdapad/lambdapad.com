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
