import { createClient } from 'redis'

const url = process.env.REDIS_URL

if (!url) {
  throw new Error('REDIS_URL is not defined')
}

export const redis = await createClient({
  url,
  socket: {
    tls: true,
    rejectUnauthorized: false // skip cert validation for dev; set to true in prod with valid CA
  }
})
  .on('error', (err) => console.error('Redis client connection error', err))
  .connect()
