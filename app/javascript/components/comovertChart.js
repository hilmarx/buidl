

const generateComovertCharts = () => {

  const comovertCharts = document.querySelector(".js-comovert-chart");
  const data = JSON.parse(comovertCharts.dataset.comovertchartlabeldata);
  const yearArray = JSON.parse(comovertCharts.dataset.yearArray);

  console.log(data)
  console.log(yearArray)


  var mixedChart = new Chart(comovertCharts, {
    type: 'line',
    data: {
      datasets: Object.keys(data).map((name) => {
        return {
          label: name,
          data: data[name]
        }
      }),
      labels: yearArray
    },
    options: {
      // scales: {
      //     xAxes: [{
      //         ticks: {
      //             suggestedMin: 20,
      //             suggestedMax: 50
      //           }
      //         }]
      //       }
          }
  });
}
// function createYearWeeks() {
//   let array = Array.apply(null, Array(53)).map(function (_, i) {return i})
//   array.splice(0, 1)
//   return array;
// }

export { generateComovertCharts };
