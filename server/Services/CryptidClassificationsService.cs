

namespace cryptipedia.Services;

public class CryptidClassificationsService
{
  public CryptidClassificationsService(CryptidClassificationsRepository repository, CryptidsService cryptidsService)
  {
    _repository = repository;
    _cryptidsService = cryptidsService;
  }
  private readonly CryptidClassificationsRepository _repository;
  private readonly CryptidsService _cryptidsService;

  internal CryptidClassificationClassification CreateCryptidClassification(CryptidClassification cryptidClassificationData, string userId)
  {
    Cryptid cryptid = _cryptidsService.GetCryptidById(cryptidClassificationData.CryptidId);
    if (cryptid.DiscovererId != userId) throw new Exception($"YOU MUST HAVE DISCOVERED THE {cryptid.Name.ToUpper()} TO ADD A CLASSIFICATION");
    return _repository.CreateCryptidClassification(cryptidClassificationData);
  }

  internal List<CryptidClassificationClassification> GetCryptidClassificationsByCryptidId(int cryptidId)
  {
    return _repository.GetCryptidClassificationsByCryptidId(cryptidId);
  }
}
