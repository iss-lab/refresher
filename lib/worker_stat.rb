class WorkerStat
  def call(worker, item, queue)
    title = "worker.#{worker.class.to_s}"
    Librato.increment "#{title}.count", source: Socket.gethostname
    Librato.timing title, source: Socket.gethostname do
      yield
    end
  end
end