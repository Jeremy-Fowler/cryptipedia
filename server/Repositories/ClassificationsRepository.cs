


namespace cryptipedia.Repositories;

public class ClassificationsRepository
{
  public ClassificationsRepository(IDbConnection db)
  {
    _db = db;
  }

  private readonly IDbConnection _db;

  internal List<Classification> GetAllClassifications()
  {
    string sql = "SELECT * FROM classifications;";

    return _db.Query<Classification>(sql).ToList();
  }
}
