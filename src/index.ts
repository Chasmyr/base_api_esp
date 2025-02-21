import build from "./server"

const server = build()

server.listen({ port: 8001, host: "0.0.0.0" }, (err, address) => {
  if (err) {
    console.error(err)
    process.exit(1)
  }
  console.log(`Server listening at http://localhost:8001`)
})