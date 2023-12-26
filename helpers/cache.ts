// cache.ts
import cache from 'node-cache';

const myCache = new cache({ stdTTL: 5*60 });

export default myCache;
