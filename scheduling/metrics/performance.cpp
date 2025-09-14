#include "performance.h"
#include <iostream>
#include <iomanip>
#include <algorithm>
#include <numeric>

PerformanceMetrics::PerformanceMetrics(const std::vector<Process>& procs, const GanttChart& chart)
    : processes(procs), gantt(chart) {}

double PerformanceMetrics::calculate_average_turnaround_time() const {
    if (processes.empty()) return 0.0;
    float sum = 0.0;
    int i=0;
    // EXAMPLE IMPLEMENTATION - [demo in class]
    for(const auto& process: processes){
            //check if process has arrived
           sum += process.turnaround_time;
           i++;
        }
    return (sum/i); // Placeholder implementation
}

double PerformanceMetrics::calculate_average_waiting_time() const {
    if (processes.empty()) return 0.0;
    float sum = 0.0;
    int i=0;
    // EXAMPLE IMPLEMENTATION - Students should implement this
    for(const auto& process: processes){
            //check if process has arrived
           sum += process.waiting_time;
           i++;
        }
    return (sum/i); // Placeholder implementation
}

double PerformanceMetrics::calculate_average_response_time() const {
    if (processes.empty()) return 0.0;
    float sum = 0.0;
    int i=0;
    // EXAMPLE IMPLEMENTATION - Students should implement this
    for(const auto& process: processes){
            //check if process has arrived
           sum+= process.response_time;
           i++;
        }
    return (sum/i); // Placeholder implementation
}

double PerformanceMetrics::calculate_cpu_utilization() const {
    // TODO: Implement CPU utilization calculation
    // 
    // CPU Utilization = (Total CPU busy time / Total time) * 100
    // 
    // You can use gantt.get_cpu_utilization() or calculate manually:
    // - Total time = gantt.get_total_time()
    // - Idle time = gantt.get_total_idle_time()
    // - Busy time = Total time - Idle time
    // 
    // Hint: The GanttChart class already has this functionality
    
    return gantt.get_cpu_utilization();  // This is already implemented
}

double PerformanceMetrics::calculate_throughput() const {
    // EXAMPLE IMPLEMENTATION - Students should implement this

    if(gantt.get_total_time()!=0){
        return (double)processes.size()/gantt.get_total_time();
    }
    return 0.0; // Placeholder implementation
}

double PerformanceMetrics::calculate_fairness_index() const {
    // One simple fairness measure:
    // Fairness = (sum of waiting times)^2 / (n * sum of (waiting times)^2)
    // where n is number of processes
    // 
    // Result closer to 1.0 means more fair scheduling

    double sum = 0.0;
    double squareSum = 0.0;

    for (auto& process: processes){
        sum += process.waiting_time;
        squareSum += (process.waiting_time*process.waiting_time);
    }

    double fairness = 1; // Default to perfectly fair
    fairness = (sum * sum)/(processes.size()*squareSum);
    
    return fairness;  
}

int PerformanceMetrics::calculate_context_switches() const {
    // BONUS: Count number of times CPU switches between different processes
    // 
    // Look at gantt chart entries and count transitions between different PIDs
    // Don't count idle time as a context switch
    
    const auto& entries = gantt.get_entries();
    if (entries.size() <= 1) return 0;
    
    int switches = 0;
    for (size_t i = 1; i < entries.size(); i++) {
        if (!entries[i-1].is_idle() && !entries[i].is_idle() && 
            entries[i-1].pid != entries[i].pid) {
            switches++;
        }
    }
    return switches;
}

void PerformanceMetrics::print_summary() const {
    if (!is_valid_metrics()) {
        std::cout << "Warning: Some processes have invalid timing data!\n";
    }
    
    std::cout << "\n=== Performance Metrics Summary ===\n";
    std::cout << std::fixed << std::setprecision(2);
    std::cout << "Average Turnaround Time: " << calculate_average_turnaround_time() << " time units\n";
    std::cout << "Average Waiting Time:    " << calculate_average_waiting_time() << " time units\n";
    std::cout << "Average Response Time:   " << calculate_average_response_time() << " time units\n";
    std::cout << "CPU Utilization:         " << calculate_cpu_utilization() << "%\n";
    std::cout << "Throughput:              " << calculate_throughput() << " processes/time unit\n";
    std::cout << "Context Switches:        " << calculate_context_switches() << "\n";
    std::cout << "Fairness Index:          " << calculate_fairness_index() << "\n";
    std::cout << "\n";
}

void PerformanceMetrics::print_detailed() const {
    print_summary();
    print_process_metrics();
    
    std::cout << "=== Gantt Chart Analysis ===\n";
    std::cout << "Total Time:      " << gantt.get_total_time() << " time units\n";
    std::cout << "Total Idle Time: " << gantt.get_total_idle_time() << " time units\n";
    std::cout << "Total Processes: " << processes.size() << "\n";
    std::cout << "\n";
}

void PerformanceMetrics::print_process_metrics() const {
    std::cout << "=== Individual Process Metrics ===\n";
    std::cout << "PID\tArrival\tBurst\tStart\tFinish\tTurnaround\tWaiting\tResponse\n";
    std::cout << "---\t-------\t-----\t-----\t------\t----------\t-------\t--------\n";
    
    for (const auto& process : processes) {
        std::cout << process.pid << "\t"
                  << process.arrival_time << "\t"
                  << process.burst_time << "\t"
                  << process.start_time << "\t"
                  << process.completion_time << "\t"
                  << process.turnaround_time << "\t"
                  << process.waiting_time << "\t"
                  << process.response_time << "\n";
    }
    std::cout << "\n";
}

int PerformanceMetrics::get_total_time() const {
    return gantt.get_total_time();
}

int PerformanceMetrics::get_total_processes() const {
    return processes.size();
}

bool PerformanceMetrics::is_valid_metrics() const {
    for (const auto& process : processes) {
        if (process.start_time < 0 || process.completion_time < 0) {
            return false;
        }
        if (process.completion_time < process.start_time) {
            return false;
        }
        if (process.start_time < process.arrival_time) {
            return false;
        }
    }
    return true;
}
