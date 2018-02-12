// Source : https://leetcode.com/problems/search-a-2d-matrix-ii/
// Author : Austin Vern Songer
// Date   : 2015-08-18

/**
 * @param {number[][]} matrix
 * @param {number} target
 * @return {boolean}
 */
var searchMatrix = function(matrix, target) {
  for (var i = 0; i < matrix.length; i++)
    for (var j = 0; j < matrix[i].length; j++)
      if (matrix[i][j] === target) return true;

  return false;
};