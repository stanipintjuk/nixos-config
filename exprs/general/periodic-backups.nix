# Enables and configures cron to do backups every night at 20 oclock
{ from, to, email }:
{ ... }:
{
  services.cron.enable = true;
  services.cron.systemCronJobs = [ "0 20 * * * root rsync -r ${from} ${to} && curl -sm 30 "k.wdt.io/${email}/mybackups?c=0_20_*_*_*"];
}
