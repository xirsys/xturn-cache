defmodule CacheTest do
  # bring in the test functionality
  use ExUnit.Case, async: true
  import Xirsys.XTurn.Cache.Store

  setup do
    {:ok, state} = init(500)
    append(state, {:item1, "this is item one"})
    {:ok, state: state}
  end

  test "can retrieve item from store", %{state: state} do
    assert item_count(state) == 1
    assert fetch(state, :item1) == {:ok, "this is item one"}
  end

  test "can retrieve item from store with ! format", %{state: state} do
    assert item_count(state) == 1
    assert fetch!(state, :item1) == "this is item one"
  end

  test "item times out after lifetime", %{state: state} do
    assert item_count(state) == 1

    receive do
      R -> R
    after
      510 ->
        assert get_state(state) == {%{}, 500, nil}
    end
  end

  test "can remove item from store", %{state: state} do
    assert item_count(state) == 1
    remove(state, :item1)
    assert item_count(state) == 0
  end
end
