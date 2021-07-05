"use strict";

function getBiggestAlgorithm(algorithms) {
  return algorithms.reduce((prev, current) => {
    return prev.size > current.size ? prev : current;
  });
}
function createAlgorithmsFromData(data) {
  const dataKeys = Object.keys(data);
  const algorithms = dataKeys.map((key) => ({
    name: key,
    hasElements: true,
    get size() {
      return data[key].length;
    },
  }));
  return algorithms;
}

function getRecommendationsFromJSON(json) {
  const jsonData = { ...json };
  const algorithms = createAlgorithmsFromData(jsonData);
  let keepSearhing = true;
  let result = [];
  let algorithmCounter = 0;
  let counter = 0;
  let biggestAlgorithm = getBiggestAlgorithm(algorithms);

  while (keepSearhing) {
    let currentAlgorithm = algorithms[algorithmCounter];
    let currentAlgorithmData = jsonData[currentAlgorithm.name];

    if (currentAlgorithm.hasElements) {
      let dataElement = currentAlgorithmData[counter];

      if (dataElement) {
        result.push(Number(dataElement.token));
      } else {
        currentAlgorithm.hasElements = false;
      }
    }
    algorithmCounter++;

    if (algorithmCounter === algorithms.length) {
      counter++;
      algorithmCounter = 0;
    }

    if (result.length >= 4 || counter >= biggestAlgorithm.size) {
      keepSearhing = false;
    }
  }
  return result;
}

module.exports = getRecommendationsFromJSON;
