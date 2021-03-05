document.addEventListener('turbolinks:load', () => {
  const timerElem = document.getElementById("timer");
  if (timerElem) {
    if (timerElem.dataset.time){
      timeSeconds = parseInt(timerElem.dataset.time)
      console.log(timeSeconds)
      timer(timerElem)
    }
  }
})

function timer(timerElem){
  timer = setInterval(function () {
      hours = Math.floor(timeSeconds / 60 / 60)
      minutes = Math.floor(timeSeconds / 60) - (hours * 60)
      seconds = timeSeconds % 60
      if (timeSeconds <= 0) {
          clearInterval(timer);
          let form = document.querySelector('form')
          form.submit()
      } else {
          let strTimer = `${Math.trunc(hours)}:${Math.trunc(minutes)}:${seconds}`;
          timerElem.innerHTML = strTimer;
      }
      --timeSeconds;
  }, 1000)
}
