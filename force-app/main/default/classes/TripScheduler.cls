
   public class TripScheduler implements Schedulable {
    
   public void execute(SchedulableContext sc) {
        TripBatch batch = new TripBatch();
        TripBatchStatus batch2 = new TripBatchStatus();
        Database.executeBatch(batch);
         Database.executeBatch(batch2);
    }

   public   void  scheduleDailyBatch() {
        String cron = '0 0 12 * * ?'; // Tous les jours à midi
        System.schedule('Planification du batch Trip V2', cron, new TripBatchScheduler());
    }
  }
