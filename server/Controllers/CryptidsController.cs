namespace cryptipedia.Controllers;


[ApiController]
[Route("api/[controller]")]
public class CryptidsController : ControllerBase
{
  public CryptidsController(CryptidsService cryptidsService, Auth0Provider auth0Provider, CryptidClassificationsService cryptidClassificationsService)
  {
    _cryptidsService = cryptidsService;
    _auth0Provider = auth0Provider;
    _cryptidClassificationsService = cryptidClassificationsService;
  }
  private readonly CryptidsService _cryptidsService;
  private readonly CryptidClassificationsService _cryptidClassificationsService;
  private readonly Auth0Provider _auth0Provider;

  [HttpGet]
  public ActionResult<List<Cryptid>> GetAllCryptids()
  {
    try
    {
      List<Cryptid> cryptids = _cryptidsService.GetAllCryptids();
      return Ok(cryptids);
    }
    catch (Exception exception)
    {
      return BadRequest(exception.Message);
    }
  }

  [HttpGet("{cryptidId}")]
  public ActionResult<Cryptid> GetCryptidById(int cryptidId)
  {
    try
    {
      Cryptid cryptid = _cryptidsService.GetCryptidById(cryptidId);
      return Ok(cryptid);
    }
    catch (Exception exception)
    {
      return BadRequest(exception.Message);
    }
  }
  [HttpGet("{cryptidId}/classifications")]
  public ActionResult<List<CryptidClassificationClassification>> GetCryptidClassificationsByCryptidId(int cryptidId)
  {
    try
    {
      List<CryptidClassificationClassification> cryptidClassifications = _cryptidClassificationsService.GetCryptidClassificationsByCryptidId(cryptidId);
      return Ok(cryptidClassifications);
    }
    catch (Exception exception)
    {
      return BadRequest(exception.Message);
    }
  }
}