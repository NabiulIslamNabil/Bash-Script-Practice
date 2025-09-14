#include "scheduler.h"
#include <iostream>
#include "process.h"

/**
 * First Come First Serve (FCFS) Scheduler
 * Also known as First In First Out (FIFO)
 * 
 * Algorithm: Execute processes in the order they arrive
 * - Non-preemptive
 * - Simple queue-based scheduling
 * 
 * TODO: Implement the schedule() function
 * HINT: Sort processes by arrival time, then execute each completely
 */
class FCFSScheduler : public Scheduler {
public:
    FCFSScheduler() : Scheduler("First Come First Serve (FCFS)") {}
    
    void schedule() override {
        std::cout << "Starting FCFS scheduling...\n";
        
        // EXAMPLE IMPLEMENTATION [Demo in class]
        sort_by_arrival_time();  

        for(const auto& process: processes){
            //check if process has arrived
            if(current_time < process.arrival_time){
                //skip untill arrival time
                advance_time(process.arrival_time);
            }

            //it is already ensured that the process has arrived.
            run_process(process.pid, process.burst_time);
        }
       
        std::cout << "FCFS scheduling completed.\n";
    }
};
