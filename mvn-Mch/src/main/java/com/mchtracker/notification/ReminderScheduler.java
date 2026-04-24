package com.mchtracker.notification;

import com.mchtracker.model.Immunization;
import com.mchtracker.service.ImmunizationService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;
import java.time.LocalDate;
import java.util.List;

/**
 * Scheduled Task for sending immunization reminders.
 * Demonstrates @Scheduled (multithreading concept).
 *
 * Uses cron expression:
 *   - fixedRate = every 60 seconds (for demo/testing)
 *   - In production, use: cron = "0 0 8 * * ?" (daily at 8 AM)
 */
@Component
public class ReminderScheduler {

    @Autowired
    private ImmunizationService immunizationService;

    /**
     * Runs every 60 seconds.
     * Checks for immunizations due in the next 7 days and prints reminders.
     */
    @Scheduled(fixedRate = 60000) // every 60 seconds
    public void sendImmunizationReminders() {
        System.out.println("\n[SCHEDULER] Running immunization reminder check at: " + LocalDate.now());

        List<Immunization> upcoming = immunizationService.getUpcomingImmunizations(7);

        if (upcoming.isEmpty()) {
            System.out.println("[SCHEDULER] No upcoming immunizations in next 7 days.");
        } else {
            System.out.println("[SCHEDULER] REMINDER - Upcoming Immunizations (next 7 days):");
            for (Immunization imm : upcoming) {
                System.out.println("  --> Child: " + imm.getChild().getName()
                        + " | Vaccine: " + imm.getVaccineName()
                        + " | Due: " + imm.getDueDate());
            }
        }

        System.out.println("[SCHEDULER] Check complete.\n");
    }

    /**
     * Runs every day at midnight to mark overdue immunizations.
     * Uses cron: second minute hour day month weekday
     */
    @Scheduled(cron = "0 0 0 * * ?")
    public void markOverdueImmunizations() {
        System.out.println("[SCHEDULER] Checking for overdue immunizations...");
        List<Immunization> pending = immunizationService.getByStatus("Pending");
        LocalDate today = LocalDate.now();
        for (Immunization imm : pending) {
            if (imm.getDueDate() != null && imm.getDueDate().isBefore(today)) {
                imm.setStatus("Overdue");
                immunizationService.saveImmunization(imm);
                System.out.println("[SCHEDULER] Marked OVERDUE: " + imm.getVaccineName()
                        + " for child " + imm.getChild().getName());
            }
        }
    }
}
