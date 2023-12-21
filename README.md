# Guessing Game
Guessing Game in Erlang

# Instruction
You are asked to implement a guessing game. A server receives requests to play the game from clients. These requests are of the form {From,Ref,start}, where From is the Pid of the client, Ref is a reference number and start is an atom. The server should then:
1. spawn a “servlet” process that plays the game with the client; and
2. then receive new client requests.
Note that by spawning a servlet the server is always responsive to new game requests. The servlet should behave as follows:
- generate a pseudorandom number in the range [0,10];
- wait for guesses from the client of the form {Pid,Ref,Number}, where Pid is its Pid, Ref is a reference number and Number is the number the client is guessing.
- answer each message, indicating whether the client has guessed (gotIt) or not (tryAgain).
The client should keep guessing random numbers. Once it has guessed correctly, both client and servlet simply ends their execution.
You can use the function rand:uniform(N) for generating random numbers between 1 and N. Also, you may include helper functions.

# Usage
- client: ggclient.erl
- server: gg.erl
