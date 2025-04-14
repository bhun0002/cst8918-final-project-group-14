
import { createClient } from 'redis';
 
  // Support local dev and Azure Redis
  const url = process.env.REDIS_URL || 'redis://localhost:6379';
  const password = process.env.REDIS_PASSWORD;
   
  export const redis = await createClient({
    url,
    password, // ✅ required for Azure Redis
    socket: {
      tls: url.startsWith('rediss://') || url.includes('6380'), // ✅ enable TLS only when needed
      rejectUnauthorized: false // ⚠️ acceptable for Azure public certs
    }
  })
    .on('error', (err) => {
      console.error('❌ Redis client connection error:', err);
    })
    .connect();