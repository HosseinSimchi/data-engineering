import time

def timer(func):
    def wrapper(*args, **kwargs):
        start_time = time.perf_counter()

        result = func(*args, **kwargs)

        end_time = time.perf_counter()
        execution_time = end_time - start_time

        print(f"{func.__name__} executed in {execution_time:.6f} seconds")

        return result

    return wrapper


@timer
def create_list():
    numbers = list(range(1, 1_000_001))
    return numbers


@timer
def calculate_sum():
    total = sum(range(1, 1_000_001))
    return total


numbers = create_list()
total = calculate_sum()

print("Sum =", total)