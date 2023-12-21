// cache.ts
import cache from 'node-cache';

const myCache = new cache({ stdTTL: 6000 });

export default myCache;
