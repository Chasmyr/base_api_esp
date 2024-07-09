import fastify from "fastify"
import cors from "@fastify/cors"

export default function build() {
    const server = fastify()

    server.register(cors, {
        origin: true
    })
    server.get('/ping', async (request, reply) => {
        return 'pong\n'
    })

    return server
}