defmodule Pmap do
	def work(x) do
		{text, _} = System.cmd("sh", ["-c", "sleep 2 && echo hi #{x}"])
		IO.puts text
	end

	def par_demo() do
		Emun.map[1,2,3,4], fn x -> work(n) end
	end

	def pmap(xs, op) do
		tasks = Enum.map xs, fn x -> Task.async(fn -> op.(x) end) end
		Enum.map tasks, fn t ->
			Task.await(t, 1000)
		end
	end
end