/**
 * @param {number[]} gifts
 * @param {number} k
 * @return {number}
 */
var pickGifts = function(gifts, k) {
    const queue = new MaxPriorityQueue();
    gifts.forEach( (gift) => queue.enqueue(gift));
    for (let i = 0; i < k; i++) {
        let gift = queue.dequeue().element;
        gift = Math.floor(Math.sqrt(gift));
        queue.enqueue(gift);
    }
    return queue.toArray().reduce((a,b) => a + b.element, 0);
};
