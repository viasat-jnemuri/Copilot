#include <iostream>
#include <future>
#include <chrono>
#include <thread>
#include <functional>
#include <random>


/**
 * @brief Executes a given function in a separate thread and waits for its completion.
 * 
 * This function takes a callable object and an integer load, wraps the callable
 * object in a std::packaged_task, and runs it in a separate thread. It waits for
 * the thread to complete execution before returning.
 * 
 * @param func A callable object (e.g., a lambda or function) that takes an int as an argument.
 * @param load An integer value to be passed to the callable object.
 */
void execute(std::function<void(int)> func, int load)
{
    std::packaged_task<void(int)> task(func);
    std::future<void> future = task.get_future();
    std::thread worker(std::move(task), load);
    worker.join();
    std::cout << "Task completed." << '\n';
}



int main()
{

    /*
    Create a lambda function named 'job' that simulates a workload by sleeping for a random time.
    Arguments:
    - workload: an integer representing the number of steps in the workload
    Returns: void
    Details:
    - For each step in the workload, sleep for a random time between 0.5 and 1.5 seconds
    - Print "Completed step #i" after each step
    Example:
    job(10);
    */
    auto job = [](int workload) -> void
    {
        for (int i = workload; i > 0; --i)
        {
            std::random_device rd;
            std::mt19937 gen(rd());
            std::uniform_real_distribution<double> dis(0.5, 1.5);
            double sleepTime = dis(gen);
            std::this_thread::sleep_for(std::chrono::duration<double>(sleepTime));
            std::cout << "Completed step #" << i << '\n';
        }
    };

    const int steps = 10;
    execute(job, steps);

    return 0;
}