const { test } = require("@jest/globals");
const file1 = require("./recommendations1.json");
const file2 = require("./recommendations2.json");
const file3 = require("./recommendations3.json");
const file4 = require("./recommendations4.json");

const getRecommendationsFromJSON = require("./index");

test("gets recommended token articles from scenario 1", () => {
  expect(getRecommendationsFromJSON(file1)).toEqual([345048]);
});

test("gets recommended token articles from scenario 2", () => {
  expect(getRecommendationsFromJSON(file2)).toEqual([790952, 103678, 788138, 802358]);
});

test("gets recommended token articles from scenario 3", () => {
  expect(getRecommendationsFromJSON(file3)).toEqual([103678, 790952, 802358, 788138]);
});

test("gets recommended token articles from scenario 4", () => {
  expect(getRecommendationsFromJSON(file4)).toEqual([790952, 103678, 802358, 562873]);
});
