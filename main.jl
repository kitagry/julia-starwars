height = 14

function clear()
  write(stdout, "\x1b[2J")
  write(stdout, "\x1b[1;1H")
  flush(stdout)
end

function main()
  i = 0
  buffer = ""
  for line in eachline("./resources/sw1.txt")
    if i % height == 0
      duration = parse(Int64, line)

      write(stdout, buffer)
      flush(stdout)

      sleep(duration * 0.05)

      clear()
      buffer = ""
    else
      buffer = string(buffer, "\n", line)
    end
    i += 1
  end
end

main()
