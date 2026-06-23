import math
import time
from multiprocessing import Pool, cpu_count


def is_prime(n):
    if n < 2:
        return False

    if n == 2:
        return True

    if n % 2 == 0:
        return False

    limit = int(math.sqrt(n)) + 1

    for i in range(3, limit, 2):
        if n % i == 0:
            return False

    return True


def sequential_prime_check(numbers):
    return [num for num in numbers if is_prime(num)]


def multiprocessing_prime_check(numbers):
    with Pool(cpu_count()) as pool:
        results = pool.map(is_prime, numbers)

    return [num for num, prime in zip(numbers, results) if prime]


if __name__ == "__main__":

    numbers = range(10_000_000, 11_000_000)

    start = time.perf_counter()

    sequential_primes = sequential_prime_check(numbers)

    sequential_time = time.perf_counter() - start

    print(f"Sequential Time: {sequential_time:.2f} seconds")
    print(f"Prime Count: {len(sequential_primes)}")

    start = time.perf_counter()

    multiprocessing_primes = multiprocessing_prime_check(numbers)

    multiprocessing_time = time.perf_counter() - start

    print(f"Multiprocessing Time: {multiprocessing_time:.2f} seconds")
    print(f"Prime Count: {len(multiprocessing_primes)}")

    print(
        f"Speedup: {sequential_time / multiprocessing_time:.2f}x"
    )