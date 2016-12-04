require 'rails_helper'

describe Strategies::Minimax do
  let(:strategy){ Strategies::Minimax.new }
  it "should return [2,1] as best move" do
    board = Board.new(cells: [
      ['o', nil, 'o'],
      [nil, 'x', 'o'],
      ['x', nil, 'x']])

    best_move, score = strategy.find_best_move(board, 'x')
    expect(best_move).to eq([2, 1])
  end

  it "should return [0,1] as best move" do
    board = Board.new(cells: [
      ['o', nil, 'o'],
      [nil, 'x', 'o'],
      ['x', nil, 'x']])

    best_move, score = strategy.find_best_move(board, 'o')
    expect(best_move).to eq([0, 1])
  end

  it "should return [1,0] as best move" do
    board = Board.new(cells: [
      ['o', 'x', 'o'],
      [nil, 'x', 'o'],
      ['x', nil, 'x']])

    best_move, score = strategy.find_best_move(board, 'o')
    expect(best_move).to eq([2, 1])
  end

  it "should return [1,0] as best move" do
    board = Board.new(cells: [
      ['o', nil, 'o'],
      [nil, 'x', 'x'],
      ['o', nil, 'x']])

    best_move, score = strategy.find_best_move(board, 'o')
    expect(best_move).to eq([0, 1])
  end

  it "should return [0,1] as best move" do
    board = Board.new(cells: [
      ['o', nil, 'o'],
      [nil, 'x', 'x'],
      [nil, nil, 'x']])

    best_move, score = strategy.find_best_move(board, 'o')
    expect(best_move).to eq([0, 1])
  end

  it "should return [0,0] as best move" do
    board = Board.new(cells: [
      [nil, nil, 'o'],
      [nil, 'x', 'x'],
      [nil, nil, 'x']])

    best_move, score = strategy.find_best_move(board, 'o')
    expect(best_move).to eq([0, 0])
  end

  it "should return [2,2] as best move" do
    board = Board.new(cells: [
      [nil, nil, nil],
      [nil, 'x', nil],
      [nil, nil, nil]])

    best_move, score = strategy.find_best_move(board, 'o')
    expect(best_move).to eq([2, 2])
  end

  it "should return [2,2] as best move" do
    board = Board.new(cells: [
      [nil, nil, nil],
      [nil, nil, nil],
      [nil, nil, nil]])

    best_move, score = strategy.find_best_move(board, 'x')
    expect(best_move).to eq([1, 1])
  end
end