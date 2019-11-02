Timesheet Application:

Timesheet is an application to log and track user efforts on a job. 

Objects in Timesheet Application:


Jobs:
Jobs are the tasks on which users work and log and their effort.

Workers: 
Workers log their effort to the timesheets on a particular job for a day. The list of jobs will be available to the workers. Each worker will have a manager.

Managers:
Managers will be able to add new jobs to the system and they will be able to approve the tasks/jobs which are submitted by the worker. A manager can have one or more employees to approve their efforts.


Functionality:
 Workers:
  1. Workers have to login by giving their email and password.
  2. Workers will have  a screen to check their timesheets status, see the jobs which are present in the jobs table.
  3. Workers can submit their timesheet by entering effort on a particular job. If the logged hours are greater than 8, system will show error and all the entered data will be lost except the first row.

  Managers:
  1. Manager can add jobs and approve timesheets of workers for whom they are supervising.
  2. Manager can edit the jobs submitted by the workers and approve them. however more than 8 hours rule is also enforced for the Manager.
  3. A manager may have many workers and the manager will be able to see and approve his workers.

  Workers Table:
   1. The workers table will have fields such as worker_id, worker name, worker email, password and also their manager id.
   2. Many Workers may refer to the same Manager.
   3. Once the Worker login, he can submit timesheet by entering the effort. If the combined effort for the submission is greater than 8 hours, error will be displayed and the records will be removed.
   4. There is no validation on the jobs, the worker enters in to timesheet. The invalid job will be submitted to the database. The Manager can decide whether to approve the timesheet or not.

   Managers Table:
   1. The Manager can add jobs to the workers. 
   2. The manager has the chance to approve each task for the worker. The manager can also edit the task, note and the number of hours logged by the worker.

  Design Choices:

  1. Manager and Workers Relation:
     The worker and managers entities have relation(one manager can manay workers). So I Worker class has a reference of Manager.
  2. Timesheets:
     A worker can log effort for many sheets. Every time the worker submits the timesheet, his id will be saved to the database and the manager can decide based on the worker id and the task he entered.
  3. The application has validations for number of hours not exceeding a limit, entering blank data to the database.
  4. There is not validation for job entered by the user.
  5. All the password are argon hashed.


  Managers:

   alice@example.com
   bob@example.com

   Workers:
    charlie@example.com
    dan@example.com

   Jobs:
     VAOR01
     VAOR02
     VAOR03
     VAOR04
password : password 
for all the users

   
