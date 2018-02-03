defmodule Tick do
	def start() do
		state0 = %{ text: "hello" }
		spawn(__MODULE__, :init, [state0])
	end

	def schedule_tick() do
		Process.send_after(self(), :tick, 2000) #send a message to this program after 2 seconds.
	end

	def init(state) do
		schedule_tick()
		loop(state)
	end

	def loop(state) do

		receive do
			:tick -> 
				IO.puts ":tick #{state.text}"
				loop(state)
				{:set_text , new_text} -> loop(%{state | text: new_text}) #Updating the state. 
		end
	end
end