{
  lib,
  pkgs,
  ...
}: {
  services.postgresql = {
    enable = true;
    package = pkgs.postgresql_16;

    ensureDatabases = [
      "plausible"
      "wakapi"
    ];
    ensureUsers = [
      {
        name = "postgres";
        ensureClauses = {
          superuser = true;
          login = true;
          createrole = true;
          createdb = true;
          replication = true;
        };
      }
      {
        name = "plausible";
        ensureDBOwnership = true;
      }
      {
        name = "wakapi";
        ensureDBOwnership = true;
      }
    ];

    checkConfig = true;
    enableTCPIP = false;

    settings = {
      max_connections = 100;
      superuser_reserved_connections = 3;

      shared_buffers = "1024 MB";
      work_mem = "32 MB";
      maintenance_work_mem = "320 MB";
      huge_pages = "off";
      effective_cache_size = "3 GB";
      effective_io_concurrency = 100;
      random_page_cost = 1.25;

      shared_preload_libraries = "pg_stat_statements";
      track_io_timing = "on";
      track_functions = "pl";

      wal_level = "replica";
      max_wal_senders = 0;
      synchronous_commit = "on";

      checkpoint_timeout = "15 min";
      checkpoint_completion_target = 0.9;
      max_wal_size = "1024 MB";
      min_wal_size = "512 MB";

      wal_compression = "on";
      wal_buffers = -1;
      wal_writer_delay = "200ms";
      wal_writer_flush_after = "1MB";

      bgwriter_delay = "200ms";
      bgwriter_lru_maxpages = 100;
      bgwriter_lru_multiplier = 2.0;
      bgwriter_flush_after = 0;

      max_worker_processes = 3;
      max_parallel_workers_per_gather = 2;
      max_parallel_maintenance_workers = 2;
      max_parallel_workers = 3;
      parallel_leader_participation = "on";

      enable_partitionwise_join = "on";
      enable_partitionwise_aggregate = "on";
      jit = "on";

      jit_above_cost = 100000;
      jit_inline_above_cost = 150000;
      jit_optimize_above_cost = 500000;

      log_min_duration_statement = 100;
      "auto_explain.log_min_duration" = 100;

      log_connections = true;
      log_statement = "all";
      logging_collector = true;
      log_disconnections = true;
      log_destination = lib.mkForce "syslog";
    };
  };
}
