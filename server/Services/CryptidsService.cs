

namespace cryptipedia.Services;

public class CryptidsService
{
  private readonly CryptidsRepository _repository;

  public CryptidsService(CryptidsRepository repository)
  {
    _repository = repository;
  }

  internal List<Cryptid> GetAllCryptids()
  {
    return _repository.GetAllCryptids();
  }

  internal Cryptid GetCryptidById(int cryptidId)
  {
    return _repository.GetCryptidById(cryptidId) ?? throw new Exception($"Invalid id: {cryptidId}");
  }
}
