
   public class TripScheduler implements Schedulable {
    
   public void execute(SchedulableContext sc) {
        TripBatch batch = new TripBatch();
        TripBatchStatus batch2 = new TripBatchStatus();
         Database.executeBatch(batch2);
        Database.executeBatch(batch);
        
    }

   public   void  scheduleDailyBatch() {
        String cron = '0  05 18 * * ?'; // Tous les jours à midi
        System.schedule('Planification du batch Trip V3', cron, new TripScheduler());
    }
  }
