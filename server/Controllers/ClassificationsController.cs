namespace cryptipedia.Controllers;



[ApiController]
[Route("api/[controller]")]
public class ClassificationsController : ControllerBase
{
  public ClassificationsController(ClassificationsService classificationsService, Auth0Provider auth0Provider)
  {
    _classificationsService = classificationsService;
    _auth0Provider = auth0Provider;
  }

  private readonly ClassificationsService _classificationsService;
  private readonly Auth0Provider _auth0Provider;

  [HttpGet]
  public ActionResult<List<Classification>> GetAllClassifications()
  {
    try
    {
      List<Classification> classifications = _classificationsService.GetAllClassifications();
      return Ok(classifications);
    }
    catch (Exception exception)
    {
      return BadRequest(exception.Message);
    }
  }

  [HttpGet("{classificationId}")]
  public ActionResult<Classification> GetClassificationById(int classificationId)
  {
    try
    {
      Classification classification = _classificationsService.GetClassificationById(classificationId);
      return Ok(classification);
    }
    catch (Exception exception)
    {
      return BadRequest(exception.Message);
    }
  }

  [HttpGet("random")]
  public ActionResult<Classification> GetRandomClassification()
  {
    try
    {
      Classification classification = _classificationsService.GetRandomClassification();
      return Ok(classification);
    }
    catch (Exception exception)
    {
      return BadRequest(exception.Message);
    }
  }
}
